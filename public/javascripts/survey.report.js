// 百度地图API功能
var map = new BMap.Map("map", { enableMapClick: false }); // 创建Map实例
map.centerAndZoom(new BMap.Point(105.403119, 38.028658), 5); // 初始化地图,设置中心点坐标和地图级别
map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放

map.setMapStyle({
    styleJson: [
        {
            "featureType": "all",
            "elementType": "all",
            "stylers": {
                "lightness": 10,
                "saturation": -100
            }
        }, {
            "featureType": "road",
            "elementType": "all",
            "stylers": {
                "visibility": "off"
            }
        }, {
            "featureType": "poilabel",
            "elementType": "all",
            "stylers": {
                "visibility": "off"
            }
        }, {
            "featureType": "administrative",
            "elementType": "all",
            "stylers": {
                "weight": "2",
                "visibility": "on"
            }
        }, {
            "featureType": "district",
            "elementType": "all",
            "stylers": {
                "visibility": "off"
            }
        }, {
            "featureType": "town",
            "elementType": "all",
            "stylers": {
                "visibility": "off"
            }
        }
    ]
});
map.setMapStyle({ style: 'midnight' });

var options = {
    draw: 'text',
    avoid: true,
    size: 16,
    font: 'Courier New',
    fillStyle: '#ff0',
    shadowColor: '#f00',
    shadowBlur: 1
}

// create data set
var data = []
var dataSet = new mapv.DataSet(data);

// init mapvLayer
var mapvLayer = new mapv.baiduMapLayer(map, dataSet, options);


////////////////////////////// main function //////////////////////////////

(function ($) {
    $.getUrlParam = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null)
            return decodeURI(r[2]);
        return null;
    }
})(jQuery);

var surveyName = 2018; //$.getUrlParam('name');
//$('#report_title_text').text(surveyName + $('#report_title_text').text());
//console.log(surveyName);

//localhost:3000/api/surveySubmit/findByName?name=调查问卷02
//var dataUrl = "//" + window.location.host + "/api/surveySubmit/findByName";
//console.log(dataUrl);

refreshAsync();

function refreshAsync() {

    $.ajax({
        url: '/api/surveySubmit/findByName',
        method: 'POST',
        data: JSON.stringify({ name: surveyName }),
        contentType: "application/json",
        dataType: "json",
        success: function (data, status, xhr) {
            // console.log(data);
            var pointData = surveyData2PointData(data);
            dataSet.set(pointData);
        },
        complete: function (xhr, status) {
            setTimeout(refreshAsync, 10 * 1000);
            //console.log('star a new timeout call');
        }
    });
}

function surveyData2PointData(surveyData) {
    var mapData = [];

    for (var i = 0; i < surveyData.length; i++) {

        //var cityCenter = mapv.utilCityCenter.getCenterByCityName(surveyData[i].city);
        //console.log(surveyData[i].city);
        //console.log(cityCenter);
        //if(!cityCenter) continue;

        mapData.push({
            geometry: {
                type: 'Point',
                //coordinates: [cityCenter.lng, cityCenter.lat]
                coordinates: [surveyData[i].x, surveyData[i].y]
            },
            text: surveyData[i].count
        });
    }

    return mapData;
}


$('#report_info_pad_list').bind('finished', onMarqueeFinished).marquee({ direction: 'up', speed: 50 });

function onMarqueeFinished(){
    $.ajax({
        url: '/api/surveySubmit/findLatestN',
        method: 'POST',
        data: JSON.stringify({ count: 10 }),
        contentType: "application/json",
        dataType: "json",
        success: function (data, status, xhr) {
            // console.log(data);

            var o = $('#report_info_pad_list');
            o.marquee('destroy');

            o.empty();
            for(var i = 0; i < data.length; i++){
                o.append('<li>[' + data[i].datetime + '] ' + (data[i].student == null ? '匿名' : data[i].student) + ' ' + data[i].city + '</li>');
                // console.log(data[i]);
            }

            o.bind('finished', onMarqueeFinished).marquee({direction: 'up', speed: 50});
        },
        complete: function (xhr, status) {
            // setTimeout(refreshReportInfoPad, 3 * 1000);
            //console.log('star a new timeout call');
        }
    });
}

// refreshReportInfoPad();

// function refreshReportInfoPad() {
//     $.ajax({
//         url: '/api/surveySubmit/findLatestN',
//         method: 'POST',
//         data: JSON.stringify({ count: 10 }),
//         contentType: "application/json",
//         dataType: "json",
//         success: function (data, status, xhr) {
//             console.log(data);

//             // var o = $('#report_info_pad_list');
//             // o.marquee('destroy');

//             // o.empty();
//             // for(var i = 0; i < data.length; i++){
//             //     o.append('<li>' + data[i].datetime + ' ' + data[i].city + '</li>');
//             //     console.log(data[i]);
//             // }

//             // o.marquee({direction: 'up', duplicated: true, speed: 50});

//         },
//         complete: function (xhr, status) {
//             // setTimeout(refreshReportInfoPad, 3 * 1000);
//             //console.log('star a new timeout call');
//         }
//     });
// }


/*
        var citys = [
            "北京",
            "天津",
            "上海",
            "重庆",
            "石家庄",
            "太原",
            "呼和浩特",
            "哈尔滨",
            "长春",
            "沈阳",
            "济南",
            "南京",
            "合肥",
            "杭州",
            "南昌",
            "福州",
            "郑州",
            "武汉",
            "长沙",
            "广州",
            "南宁",
            "西安",
            "银川",
            "兰州",
            "西宁",
            "乌鲁木齐",
            "成都",
            "贵阳",
            "昆明",
            "拉萨",
            "海口"
        ];
*/

/*
        // auto refresh data set
        setInterval(refresh, 3000);

        function refresh() {
            data = generateData(citys);
            allDataSet = new mapv.DataSet(data);
            dataSet.set(data);
        }

        function generateData(citys) {
            var data = [];

            for (var i = 0; i < citys.length; i++) {
                var cityCenter = mapv.utilCityCenter.getCenterByCityName(citys[i]);
                data.push({
                    geometry: {
                        type: 'Point',
                        coordinates: [cityCenter.lng, cityCenter.lat]
                    }, 
                    text: (4 * Math.random()).toFixed(0)
                });
            }

            return data;
        }
*/
