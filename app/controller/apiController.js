"use strict";

const model = require('../model');
const service = require('../service');
const config = require('../config');

const MariadbClient = require('mariasql');
const request = require("request");

const logger = service.getLogger('apiService.js');

class ApiController {

    constructor(res){
        this.res = res;
        // logger.debug(res);
    }

    sendResponse(code, o) {
        this.res.status(code);
        // logger.debug(code);
        this.res.json(o)
        // logger.debug(o);

    }

    addSurveySubmit(params) {

        let _this = this;

        let locationService = new service.IpLocationService();
        let location = locationService.findCityByIp(params.ip);

        let client = new MariadbClient(config.MARIADB);

        let insertSubmittedLocationTemplate = client.prepare(
            'INSERT INTO `submitted_location` ' +
            '(`name`, `student`, `ip`, `datetime`, `city`, `location`) ' +
            'VALUES (:name, :student, :ip, :datetime, :city, :location)');

        let insertCityPointTemplate = client.prepare(
            'INSERT INTO `city_point` ' +
            '(`city`, `x`, `y`, `location`) ' +
            'VALUES (:city, :x, :y, :location)');

        request('http://api.map.baidu.com/location/ip?ip=' + params.ip + '&ak=4SUOswuyXWNUV5kSUGoxgQx4ms7lamxh&coor=bd09ll', 
            function (error, response, body) {
                if (!error && response.statusCode == 200) {
                    // logger.debug(body) // Show the HTML for the baidu homepage.
                    let jsonResult = JSON.parse(body);
                    // logger.debug(jsonResult);
                    if(jsonResult && jsonResult.status == 0){
                        logger.debug(jsonResult.content.address);
                        logger.debug(jsonResult.content.point);
                        // logger.debug(jsonResult.content.address_detail.city);
                        // logger.debug(jsonResult.content.point);
                        let cityPoint = new model.CityPoint({
                            city: location.city, 
                            x: jsonResult.content.point.x, 
                            y: jsonResult.content.point.y, 
                            location: JSON.stringify(jsonResult)
                        });
                        client.query(insertCityPointTemplate(cityPoint), function (e, rows) {
                            if (e) {
                                logger.error(e);
                            }else{
                                // logger.debug('insertCityPointTemplate');
                                logger.debug(cityPoint);
                                // logger.debug(rows);
                            }
                        });
                    }else{
                        logger.debug(jsonResult.status);
                    }
                }
            }
        );
        
        let surveySubmit = new model.SurveySubmit({
            name: params.name,
            student: params.student,
            ip: params.ip,
            datetime: params.datetime,
            city: location.city,
            location: JSON.stringify(location.detail)
        });
        logger.debug(surveySubmit);
        client.query(insertSubmittedLocationTemplate(surveySubmit), function (e, rows) {
            if (e) {
                logger.error(e);
                _this.sendResponse(400, e.message);
            }else{
                // logger.debug('insertSubmittedLocationTemplate');
                // logger.debug(rows);
                _this.sendResponse(200, surveySubmit);
            }
        });

        client.end();
    }

    querySurveySubmitsByName(name) {

        let _this = this;
        // logger.debug(_this)

        //Only for test use
        if(!name){
            _this.res.sendResponse(200, []);
            return;
        }

        let client = new MariadbClient(config.MARIADB);

        // logger.debug(name);
        let selectTemplate = client.prepare(
            'SELECT s.`city`, COUNT(*) AS count, p.`x`, p.`y` FROM `submitted_location` AS s LEFT JOIN `city_point` AS p ON s.`city` = p.`city` ' + 
            'WHERE s.`name` = :name AND s.`city` IS NOT NULL AND s.`city` != "" AND p.`x` IS NOT NULL AND p.`y` IS NOT NULL ' + 
            'GROUP BY `city`');

        client.query(selectTemplate({name: name}), function (e, rows) {
            if (e) {
                logger.error(e);
                _this.sendResponse(400, e.message);
            }else{
                // logger.debug(rows);
                _this.sendResponse(200, rows);
            }
        });

        client.end();
        
    }

    queryLatestSurveySubmits(count) {

        let _this = this;
        // logger.debug(_this)

        let client = new MariadbClient(config.MARIADB);

        let selectTemplate = 
        //client.prepare(
            'SELECT `name`, `student`, `datetime`, `city`, `ip` FROM `submitted_location` ' + 
            'WHERE `city` IS NOT NULL AND `city` != "" AND `datetime` IS NOT NULL ' + 
            'ORDER BY `datetime` DESC, `id` DESC LIMIT ' + count;
        //);
        // logger.debug(selectTemplate);
        client.query(selectTemplate, function (e, rows) {
            if (e) {
                logger.error(e);
                _this.sendResponse(400, e.message);
            }else{
                // logger.debug(rows);
                _this.sendResponse(200, rows);
            }
        });

        client.end();
        
    }

}

module.exports = ApiController;