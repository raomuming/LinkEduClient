//
//  http_client.cpp
//  AriCore
//
//  Created by Eric Rao on 28/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "http_client.hpp"
#include "request_notification.hpp"

#include "Poco/Net/HTTPSClientSession.h"
#include "Poco/Net/HTTPRequest.h"
#include "Poco/Net/HTTPResponse.h"
#include "Poco/Util/JSONConfiguration.h"
#include "Poco/URI.h"


namespace ari {
    HTTPClient::HTTPClient(const std::string& name, NotificationQueue& queue)
    : _name(name)
    , _queue(queue)
    {}
    
    // refer the HTTPLoadTest example
    void HTTPClient::run()
    {
        for (;;) {
            Notification::Ptr pNf(_queue.waitDequeueNotification());
            if (pNf) {
                RequestNotification::Ptr pRequestNf= pNf.cast<RequestNotification>();
                if (pRequestNf) {
                    // DO The request part.
                }
            }
        }
    }
    
    // this refer to twitter example.
    Poco::Net::HTTPResponse::HTTPStatus HTTPClient::doRequest(Poco::AutoPtr<Poco::Util::AbstractConfiguration>& pResult)
    {
        // TODO: need the full path of the request
        Poco::URI uri("");
        // TODO: stringify a json object
        std::string str;
        Poco::Net::HTTPSClientSession session(uri.getHost(), uri.getPort());
        Poco::Net::HTTPRequest req(Poco::Net::HTTPRequest::HTTP_POST, uri.getPath(), Poco::Net::HTTPRequest::HTTP_1_1);
        
        req.setChunkedTransferEncoding(false);
        req.setContentType("application/json");
        req.setContentLength(str.length());
        
        session.sendRequest(req) << str;
        
        Poco::Net::HTTPResponse res;
        std::istream& rs = session.receiveResponse(res);
        
        pResult = new Poco::Util::JSONConfiguration(rs);
        
        return res.getStatus();
    }
}
