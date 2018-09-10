"use strict";

const model = require('../model');
const IpLocationService = require('./ipLocationService');

class ApiService{
    addSurveySubmit(surveySubmit){
        let locationService = new IpLocationService();
        let city = locationService.findCityByIp(surveySubmit.ip);
        // console.log(city);
        return city;
    }

    querySurveySubmitsByName(name){
        let surveySubmit = new model.SurveySubmit({});
        // console.log(surveySubmit);
        return surveySubmit;
    }
}

module.exports = ApiService;