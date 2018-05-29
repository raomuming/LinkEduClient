//
//  network_manager.cpp
//  AriCore
//
//  Created by Eric Rao on 29/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "network_manager.hpp"
#include "../task/async_task.hpp"
#include "Poco/ThreadPool.h"
#include "Poco/URI.h"
#include "Poco/Util/JSONConfiguration.h"
#include "Poco/Net/HTTPSClientSession.h"
#include "Poco/Net/HTTPRequest.h"
#include "Poco/Net/HTTPResponse.h"
#include <mutex>

using Poco::ThreadPool;
using Poco::Net::HTTPSClientSession;
using Poco::URI;
using Poco::Util::JSONConfiguration;
using Poco::Net::HTTPRequest;
using Poco::Net::HTTPResponse;

namespace ari {
    
    std::shared_ptr<NetworkManager> NetworkManager::instance()
    {
        static std::shared_ptr<NetworkManager> instance;
        static std::once_flag flag;
        std::call_once(flag, [&]{
            instance = std::make_shared<NetworkManager>();
        });
        return instance;
    }
    
    void NetworkManager::addRequest(const std::shared_ptr<HTTPParams> params)
    {
        auto task = std::make_shared<AsyncTask>();
        task->setFunc([&params]{
            URI uri(params->path());
            
            HTTPSClientSession session(uri.getHost(), uri.getPort());
            HTTPRequest req(params->httpMethod(), uri.getPath(), HTTPRequest::HTTP_1_1);
            
            if (params->httpMethod() != HTTPRequest::HTTP_GET) {
                req.setChunkedTransferEncoding(false);
                req.setContentType("application/json");
                req.setContentLength(params->toString().length());
            }
            
            session.sendRequest(req) << params->toString();
            
            HTTPResponse res;
            std::istream& rs = session.receiveResponse(res);
            
            auto pResult = std::make_shared<JSONConfiguration>(rs);
            
            params->onRequestFinished(res.getStatus(), pResult);
        });
        
        ThreadPool::defaultPool().start(*task);
    }
}
