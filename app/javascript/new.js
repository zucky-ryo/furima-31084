window.addEventListener('load', () => {
  let urlPath = location.pathname;
  if ((urlPath.match(/items/) && urlPath.match(/\d/) == null) || (urlPath.match(/items/) && urlPath.match(/\d/) && urlPath.match(/edit/))) {
    const form = document.getElementById("item-price");
    const tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    form.addEventListener('input', () => {
      let price = form.value;
      let taxRes = parseInt(price / 10);
      let profitRes = price - taxRes;
      tax.innerHTML = taxRes;
      profit.innerHTML = profitRes;
    });
  }
});