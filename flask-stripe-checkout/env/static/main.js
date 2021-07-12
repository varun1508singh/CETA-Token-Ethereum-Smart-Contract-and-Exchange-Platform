console.log("Sanity Check!");

// Get Stripe publishable key
fetch("/config")
.then((result) => { return result.json(); })
.then((data) => {
  // Initialize Stripe.js
  const stripe = Stripe(data.publicKey);

  // Event handler
  document.querySelector("#submitBtn").addEventListener("click", () => {
    var url = new URL("http://localhost:5000/create-checkout-session")
    var params = {amount:document.getElementById('fname').value, address:document.getElementById('lname').value}
    url.search = new URLSearchParams(params).toString();
    // Get Checkout Session ID
    fetch(url)
    .then((result) => { return result.json(); })
    .then((data) => {
      console.log(data);
      // Redirect to Stripe Checkout
      return stripe.redirectToCheckout({sessionId: data.sessionId})
    })
    .then((res) => {
      console.log(res);
    });
  });
});
