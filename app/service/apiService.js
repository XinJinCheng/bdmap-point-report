var model = require("../model");

class ApiService{
    addSurveySubmit(surveySubmit){
        console.log(surveySubmit);
    }

    querySurvaySubmitsByName(name){
        console.log(name);
        let surveySubmit = new model.SurveySubmit({});
        console.log(surveySubmit);
        return surveySubmit;
    }
}

module.exports = ApiService;