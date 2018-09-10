"use strict";

const datx = require('ipip-datx'); // 引入ipip-datx模块

class IpLocationService {

    findCityByIp(ip) {
        let citys = new datx.City(process.cwd() + "/app/data/17monipdb/17monipdb.datx");

        // findSync 此方法只接受IPv4类型的IP地址，请自行检查参数是否符合规定；
        let location = citys.findSync(ip);
        // console.log(location);

        let city = "";
        while (location.length > 0 && city == "") {
            city = location.pop();
        }

        return {
            city: city,
            detail: location
        };

    }
}

module.exports = IpLocationService;