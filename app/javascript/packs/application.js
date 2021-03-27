// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';
import { initChatroomCable } from '../channels/chatroom_channel';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initFlatpickr } from '../plugins/init_flatpickr.js';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initChatroomCable();
  initMapbox();
  initUpdateNavbarOnScroll();
  initFlatpickr();
  if ($('[data-toggle="tooltip"]')) {
    $('[data-toggle="tooltip"]').tooltip()
  }

  // (function() {
  // var stripe = Stripe('pk_test_51IUYBDF6fb1ssZ6XrTPROGliDipM0q1mSF21PybUl5j30Ktv02CCnrgTsod5gdJ6Abk0EFhNlxTGvDDoymaRaJjD00N9RN4gOx');

  // var checkoutButton = document.getElementById('checkout-button-price_1IVgVCF6fb1ssZ6XpGxVWg5j');
  // checkoutButton.addEventListener('click', function () {
  //   /*
  //    * When the customer clicks on the button, redirect
  //    * them to Checkout.
  //    */
  //   stripe.redirectToCheckout({
  //     lineItems: [{price: 'price_1IVgVCF6fb1ssZ6XpGxVWg5j', quantity: 1}],
  //     mode: 'payment',

  //      * Do not rely on the redirect to the successUrl for fulfilling
  //      * purchases, customers may not always reach the success_url after
  //      * a successful payment.
  //      * Instead use one of the strategies described in
  //      * https://stripe.com/docs/payments/checkout/fulfill-orders

  //     successUrl: 'http://www.yourhoxtonhero.com/donations',
  //     cancelUrl: 'http://www.yourhoxtonhero.com/nondonations',
  //   })
  //   .then(function (result) {
  //     if (result.error) {
  //       /*
  //        * If `redirectToCheckout` fails due to a browser or network
  //        * error, display the localized error message to your customer.
  //        */
  //       var displayError = document.getElementById('error-message');
  //       displayError.textContent = result.error.message;
  //     }
  //   });
  // });
});
