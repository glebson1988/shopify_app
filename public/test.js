const elem = document.getElementById('lookbook_app')
const url = window.location.href
const shop = window.location.host
const handle = url.split('/').pop().split('?').shift()
fetch(`https://572729e35043.ngrok.io/api/v1/front_end/index?shop=${shop}`, {
    method: "GET"
})
    .then(res => res.json())
    .then(resp => {
    let current_product = resp.filter(product => {
        return product.shopify_handle == handle
    })[0]
    elem.innerHTML = current_product.lookbook_html
})
