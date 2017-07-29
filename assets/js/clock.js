function date(){
    days = [
        "Sunday",
        "Monday",
        "Tuesday",
        "wednesday",
        "Thursday",
        "Friday",
        "Saturday"
    ];
    months = [
     "January",
     "Febrary",
     "March",
     "April",
     "May",
     "June",
     "July",
     "August",
     "Septemeber",
     "October",
     "November",
     "December"
    ];

    var date = new Date();
    var day = date.getDay();
    var number = date.getDate();
    var month = date.getMonth();
    var year = date.getFullYear();
    var crHrs = date.getHours();  
    var crMns = date.getMinutes();  
    var crScs = date.getSeconds();  
    crMns = (crMns < 10 ? "0" : "")+ crMns;  
    crScs = ( crScs < 10 ? "0" : "")+ crScs;  
    var timeOfDay = (crHrs < 12) ? "AM" : "PM";  
    crHrs = (crHrs > 12) ? crHrs - 12 : crHrs;  
    crHrs = (crHrs == 0) ? 12 : crHrs;  
    var full_year = months[month]+" "+number+", "+year;
    var crTimeString = crHrs+":"+crMns+":"+crScs+""+timeOfDay;  
    var full_year_with_clock = full_year+" "+crTimeString;
    $('#clock').html(full_year_with_clock);
}

$(document).ready(function(){
    setInterval('date()',1);
});