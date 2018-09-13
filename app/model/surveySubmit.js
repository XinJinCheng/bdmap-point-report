"use strict";

class SurveySubmit {

    constructor(params) {
        this.id = params.id;
        this.name = params.name;
        this.student = params.student;
        this.ip = params.ip;
        this.datetime = params.datetime;
        this.city = params.city;
        this.location = params.location;
    }
}

module.exports = SurveySubmit;