
class SurveySubmit{

    constructor(params){
        if(params.id) this.id = params.id;
        this.name = params.name;
        this.ip = params.ip;
        this.datetime = params.datetime;
        this.city = params.city;
    }

}

module.exports = SurveySubmit;