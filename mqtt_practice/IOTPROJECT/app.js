// mosquitto server dht11 topic에서 온도 습도 데이터를 읽어오기
const mqtt = require("mqtt");
const client = mqtt.connect("mqtt://172.30.1.44");
// node.js ---> mosquitto server 
client.on("connect", () => {
    console.log("mqtt connected");
    client.subscribe("dht11");
});
client.on("message", (topic, message) => { // json 구조
    
});