// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
import "stylesheets/application"
require("trix")
require("@rails/actiontext")

document.addEventListener("turbolinks:load", () => {
  const tabElements = document.querySelectorAll('#nav-tab .tab');

  function onTabClick(event) {
    const activeTabs = document.querySelectorAll('.active');

    activeTabs.forEach(function(tab) {
      tab.classList.toggle('active');
    });


    event.target.parentElement.classList.add('active');

    event.preventDefault();

    // show and hide tab panels
    var tabPanel = document.getElementById(event.target.href.split("#")[1]);
    tabPanel.classList.toggle('active');
  }


  if(tabElements != null) {
    tabElements.forEach(function(tab) {
      tab.addEventListener('click', (event) => {
        onTabClick(event);
      });
    });
  }
});