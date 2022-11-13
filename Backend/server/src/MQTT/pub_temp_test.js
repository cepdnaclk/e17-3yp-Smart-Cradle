const mqtt= require("mqtt");
var client=mqtt.connect('mqtt://broker.hivemq.com');


client.on("connect",function(){

    setInterval(function(){

        var random_temp=Math.random()*50;
        console.log(random_temp);

        client.publish('Temperature',
        'current room temperature :'+random_temp.toString())
    }),30000;



});