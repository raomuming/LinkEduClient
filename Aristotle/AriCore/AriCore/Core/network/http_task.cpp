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
#include "Poco/Net/Context.h"

using Poco::URI;
using Poco::Net::HTTPSClientSession;
using Poco::Net::HTTPRequest;
using Poco::Net::HTTPResponse;
using Poco::Net::Context;

namespace ari {
    HTTPTask::HTTPTask(const std::shared_ptr<HTTPModel>& model)
    : Task("http_task")
    , _model(model)
    {}
    
    HTTPTask::~HTTPTask()
    {
        
    }

    void HTTPTask::runTask()
    {
        if (!_model) {
            return;
        }
        
        URI uri(_model->path());
        
        Context::Ptr context = new Context(Context::CLIENT_USE, "", "", "", Context::VERIFY_NONE, 9, false);
        HTTPSClientSession session(context);
        session.setHost(uri.getHost());
        session.setPort(uri.getPort());
        
        if (_model->httpMethod() == HTTPRequest::HTTP_GET) {
            HTTPRequest req(_model->httpMethod(), uri.getPathAndQuery(), HTTPRequest::HTTP_1_1);
            session.sendRequest(req) << std::flush;
        } else {
            HTTPRequest req(_model->httpMethod(), uri.getPath(), HTTPRequest::HTTP_1_1);
            req.setChunkedTransferEncoding(false);
            req.setContentType("application/json");
            req.setContentLength(_model->toString().length());
            session.sendRequest(req) << _model->toString() << std::flush;
        }
        
        HTTPResponse res;
        std::istream& rs = session.receiveResponse(res);
        auto result = std::make_shared<JSONConfiguration>(rs);
        
        _model->onRequestFinished(res.getStatus(), result);
    }
}
