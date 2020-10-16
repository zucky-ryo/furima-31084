window.addEventListener('load', () => {
  let urlPath = location.pathname;
  if (urlPath.match(/orders/)) {
    document.getElementById("postal-code").removeAttribute("value");
    document.getElementById("prefecture").options[0].selected = true
    document.getElementById("city").removeAttribute("value");
    document.getElementById("addresses").removeAttribute("value");
    document.getElementById("building").removeAttribute("value");
    document.getElementById("phone-number").removeAttribute("value");
  }
});