const HRBB = {
	// Texas A&M Harvey R. "Bum" Bright Building (HRBB)
	loc: {
		lat: 30.619028,
		lng: -96.338789
	},
	zoom: 18
};

function getVehicleMarker(duty) {
	let icon = duty.isAlert ?
		"/images/car-alert.png" :
		"/images/car.png";
	return {
		"lat": duty.vehicleLat,
		"lng": duty.vehicleLng,
		"picture": {
			"url": icon,
			"width":  64,
			"height": 64
		},
		"infowindow": getInfoWindow(duty)
	};
}

function getInfoWindow(duty) {
	let infoWindow = "";
	let vehicle = getHTMLTagString("p", "Vehicle#", `${duty.plateNumber}`);
	infoWindow += vehicle;
	let dName = getHTMLTagString("p", "Driver Name", `${duty.driverName}`);
	infoWindow += dName;
	let sName = getHTMLTagString("p", "Student Name", `${duty.studentName}`);
	infoWindow += sName;
	let sID = getHTMLTagString("p", "Student ID", `${duty.studentId}`);
	infoWindow += sID;
	return infoWindow;
}

function getHTMLTagString(tag, title, content) {
	return `<${tag}><b>${title}:</b> ${content}</${tag}>`;
}
