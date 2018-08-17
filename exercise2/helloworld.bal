import ballerina/http;
import ballerina/log;

endpoint http:Listener listener{
    port : 9090
};

service <http:Service> hello bind listener{
    sayHello(endpoint caller, http:Request req){
        http:Response res = new;
        res.setPayload("Hello World!");

        caller->respond(res)but{
            error e => log:printError("Error sending response")
        };
    }
}