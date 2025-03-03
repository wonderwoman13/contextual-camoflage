function geolocateUser() {
  var authorizedLocation = localStorage.getItem('authorizedLocation');
  if (!authorizedLocation) {
    informUser();
  };

  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(success, error);
    $('#loading-modal').modal("open");
  } else {
    alert("Sorry! Geolocation services are unavailable in this browser. Please use an up to date browser or you will be unable to interact with this installation.");
  }
}

function success(position) {
  console.log(position)
  if(position) {
    $('#loading-modal').modal("close");
    $('#latitude').val(position.coords.latitude);
    $('#longitude').val(position.coords.longitude);
  }
}

function error() {
  alert("Sorry, no position available.");
}

function informUser() {
  var isConfirmed = confirm("In order to interact with Contextual Camouflage, please allow this app to locate your coordinates. Please note we do not store any sensitive data unless you choose to provide it otherwise.");
  if(isConfirmed) {
    localStorage.setItem('authorizedLocation', true);
    return true;
  } else {
    alert("Sorry! You may view the site but form submission will be disabled.");
    return false;
  }
}

$(document).on('turbolinks:load', function() {
  geolocateUser();
});
