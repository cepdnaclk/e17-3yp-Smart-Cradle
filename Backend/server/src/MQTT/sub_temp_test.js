const mqtt=require("mqtt");
var client =mqtt.connect('mqtt://broker.hivemq.com');


client.on('connect',function(){

    client.subscribe("Temperature");
    console.log("Subscribed Successfully");


});

client.on('message',function(topic,message){

    console.log(message.toString());
});
