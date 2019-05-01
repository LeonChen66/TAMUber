// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree . 
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require gmaps/google
//= require jquery
//= require js-routes
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require fullcalendar-columns
//= require daterangepicker



function clearCalendar() {
    $('#calendar').fullCalendar('delete');
    $('#calendar').html('');
};
$(document).on('turbolinks:before-cache', clearCalendar);

var initialize_calendar;
initialize_calendar = function () {
    $('#calendar').each(function () {
        var calendar = $(this);
        calendar.fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            selectable: true,
            selectHelper: true,
            editable: true,
            eventLimit: true,
            // Below is the multiCol for Drivers display
            defaultView: 'multiColAgendaDay',
            events: '/events.json',
            views: {
                multiColAgendaDay:
                {
                    type: 'multiColAgenda',
                    duration: { days: 1 },
                    numColumns: 2,
                    columnHeaders: ['Driver1','Driver2'],
                }
            },
            dayClick: function (date, jsEvent, view) {
                $('#calendar').fullCalendar('changeView', 'agendaDay')
                $('#calendar').fullCalendar('gotoDate', date);
            },
            
            select: function (start, end) {
                $.getScript('/events/new', function () {
                    $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
                    date_range_picker();
                    $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
                    $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
                });

                calendar.fullCalendar('unselect');
            },

            eventDrop: function (event, delta, revertFunc) {
                event_data = {
                    event: {
                        id: event.id,
                        start: event.start.format(),
                        end: event.end.format()
                    }
                };
                $.ajax({
                    url: event.update_url,
                    data: event_data,
                    type: 'PATCH'
                });
            },

            eventClick: function (event, jsEvent, view) {
                $.getScript(event.edit_url, function () {
                    $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
                    date_range_picker();
                    $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
                    $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
                });
            }
        });
    })
};
$(document).on('turbolinks:load', initialize_calendar);

$(function(){
	require([
        "esri/Map",
        "esri/views/MapView",
        "esri/layers/TileLayer",
        "esri/Graphic",
        "esri/symbols/PictureMarkerSymbol",
        "dojo/domReady!"
      ], function(Map, MapView, TileLayer, Graphic, PictureMarkerSymbol) {
            var map = new Map();
            var point = {
                type: "point",
                longitude: -96.35539,
                latitude: 30.61348
            };
            
            // Create symbol for cars
            var carSymbol = {
                type: "picture-marker", 
                url: "https://i.imgur.com/6ZZyFuO.png", 
                width: "180px",
                height: "130px"
            };
            
            // Create the underlying map view
            var view = new MapView({
                container: "amap",
                scale: 8000,
		 	    center: [-96.34696, 30.61364],
                map: map
            });
            
            // Aggie Map layer
            var layer = null, 
            layerUrl = "https://gis.tamu.edu/arcgis/rest/services/FCOR/BaseMap_011019/MapServer",
            layer = new TileLayer(layerUrl, null);
            map.layers.add(layer);
            
            var popInfo = {
                Driver: "Handong Hao",
                Vehicle: "tamu_1",
                Status: "Available"
            };

            
            var pointGraphic = new Graphic({
                    geometry: point,
                    symbol: carSymbol,
                    attributes: popInfo,
                    // Create pop-up template, this template shows when a car icon is clicked
                    popupTemplate: {
                      title: "{Info}",
                      content: [
                        {
                          type: "fields",
                          fieldInfos: [
                            {
                              fieldName: "Driver"
                            },
                            {
                              fieldName: "Vehicle"
                            },
                            {
                              fieldName: "Status"
                            }
                          ]
                        }
                      ]
                    }
            });
            
            setInterval(function(){ 
                // We change the latitude a little bit a time to create animation of car
                // By Quickly remove and add the icon, we make the car moves
                point.latitude += 0.00001;
                view.graphics.remove(pointGraphic);
                pointGraphic.geometry = point;
                view.graphics.add(pointGraphic);
            }, 75);
      });
    
})