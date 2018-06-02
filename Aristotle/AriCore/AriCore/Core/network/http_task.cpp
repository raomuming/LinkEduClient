//
//  http_task.cpp
//  AriCore
//
//  Created by Eric Rao on 02/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "http_task.hpp"
#include "Poco/URI.h"
#include "Poco/Net/HTTPSClientSession.h"
#include "Poco/Net/HTTPRequest.h"
#include "Poco/Net/HTTPResponse.h"

using Poco::URI;
using Poco::Net::HTTPSClientSession;
using Poco::Net::HTTPRequest;
using Poco::Net::HTTPResponse;

namespace ari {
    HTTPTask::HTTPTask(const std::shared_ptr<HTTPModel>& model)
    : Task("http_task")
    , _model(model)
    {}
    
    void HTTPTask::runTask()
    {
        if (!_model) {
            return;
        }
        
        URI uri(_model->path());
        
        HTTPSClientSession session(uri.getHost(), uri.getPort());
        HTTPRequest req(_model->httpMethod(), uri.getPath(), HTTPRequest::HTTP_1_1);
        
        if (_model->httpMethod() != HTTPRequest::HTTP_GET) {
            req.setChunkedTransferEncoding(false);
            req.setContentType("application/json");
            req.setContentLength(_model->toString().length());
        }
        
        session.sendRequest(req) << _model->toString();
        
        HTTPResponse res;
        std::istream& rs = session.receiveResponse(res);
        auto result = std::make_shared<JSONConfiguration>(rs);
        
        _model->onRequestFinished(res.getStatus(), result);
    }
}
