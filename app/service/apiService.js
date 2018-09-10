"use strict";

const model = require('../model');
const IpLocationService = require('./ipLocationService');
const config = require('../config');
const MariadbClient = require('mariasql');
const logger = require('./logService')('apiService.js');

class ApiService {

    constructor(responsor){
        this.responsor = responsor;
        // logger.debug(responsor);
    }

    addSurveySubmit(params) {

        logger.debug(params);

        let locationService = new IpLocationService();
        let location = locationService.findCityByIp(params.ip);
        logger.debug(location);

        let surveySubmit = new model.SurveySubmit({
            name: params.name,
            ip: params.ip,
            datetime: params.datetime,
            city: location.city,
            location: JSON.stringify(location.detail)
        });

        logger.debug(surveySubmit);

        let client = new MariadbClient(config.MARIADB);

        let insertTemplate = client.prepare(
            'INSERT INTO `submitted_location` ' +
            '(`name`, `ip`, `datetime`, `city`, `location`) ' +
            'VALUES (:name, :ip, :datetime, :city, :location)');

        // let rows;
        // try {
        //     rows = await client.query(insertTemplate(surveySubmit));
        //     logger.debug(rows);
        // } catch (e) {
        //     logger.error(err);
        // }

        // this.insertOne(client).then((rows) => {
        //     logger.debug(rows);
        //     ret = true;
        // }).catch((e) => {
        //     logger.error(e);
        // });

        let _this = this;
        // logger.debug(_this)
        client.query(insertTemplate(surveySubmit), function (e, rows) {
            if (e) {
                logger.error(e);
                _this.responsor.sendResponse(400, e);
            }else{
                logger.debug(rows);
                _this.responsor.sendResponse(200, rows);
            }
        });

        client.end();
    }

    querySurveySubmitsByName(name) {
        let surveySubmit = new model.SurveySubmit({});
        // console.log(surveySubmit);
        return surveySubmit;
    }

    // insertOne(client){
    //     let p = new Promise((resolve, reject) => {
    //         client.query(insertTemplate(surveySubmit), function (e, rows) {
    //             if (e) {
    //                 reject(e);
    //             }else{
    //                 resolve(rows);
    //             }
    //         });
    //     });
    //     return p;
    // }
}

module.exports = ApiService;