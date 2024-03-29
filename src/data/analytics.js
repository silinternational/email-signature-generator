// TODO: rename this in cloudflare
const GA_MEASUREMENT_ID = process.env.GOOGLE_ANALYTICS_ID || ''

init()

// https://developers.google.com/analytics/devguides/collection/gtagjs
// https://developers.google.com/analytics/devguides/collection/upgrade/analyticsjs
function init() {
  loadLib()
  ;(window).dataLayer = (window).dataLayer || []
  window.gtag = () => (window).dataLayer.push(arguments)
  gtag('js', new Date())

  gtag('config', GA_MEASUREMENT_ID)
}

function loadLib() {
  const script = document.createElement('script')

  script.src = `https://www.googletagmanager.com/gtag/js?id=${GA_MEASUREMENT_ID}`
  script.async = true

  document.head.appendChild(script)
}
