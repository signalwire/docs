var d=document;
s=d.createElement("script");
s.type="text/javascript";
s.id="zohodeskasapscript";
s.defer=!0;
s.nonce="{SIGNALWIRE_DOCS_CSP_NONCE}";
s.src="https://desk.zoho.com/portal/api/web/asapApp/1029313000018680386?orgId=860856588";
t=d.getElementsByTagName("script")[0];
t.parentNode.insertBefore(s,t);
window.ZohoDeskAsapReady=function(s){
  var e=window.ZohoDeskAsap__asyncalls=window.ZohoDeskAsap__asyncalls||[];
  window.ZohoDeskAsapReadyStatus?
    (s&&e.push(s),e.forEach(s=>s&&s()),window.ZohoDeskAsap__asyncalls=null)
    :s&&e.push(s)
};