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
            allDaySlot: false,
            displayEventTime:false,
            eventColor: '#378006',
            // Below is the multiCol for Drivers display
            defaultView: 'multiColAgendaDay',
            events: '/events.json',
            views: {
                multiColAgendaDay:
                {
                    type: 'multiColAgenda',
                    duration: { days: 1 },
                    numColumns: gon.driver_num,
                    columnHeaders: gon.drivers_name,
                    // ,
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
		"dojo/domReady!"
	], function(Map, MapView, TileLayer) {
				var map = new Map();
				var view = new MapView({
						container: "amap",
						map: map,
						scale: 8000,
		 				center: [-96.34696, 30.61364]
				});
				var layer = null, 
				layerUrl = "https://gis.tamu.edu/arcgis/rest/services/FCOR/BaseMap_011019/MapServer",
				layer = new TileLayer(layerUrl, null);
				map.layers.add(layer);
	});
    
})