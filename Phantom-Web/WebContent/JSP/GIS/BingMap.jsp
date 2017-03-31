<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Bing Maps</title>
    <link rel="stylesheet" href="https://openlayers.org/en/v4.0.1/css/ol.css" type="text/css">
    <!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
    <script src="https://openlayers.org/en/v4.0.1/build/ol.js"></script>
  </head>
  <body>
     <div id="map" class="map"></div>
     <select id="layer-select">
       <option value="Aerial">Aerial</option>
       <option value="AerialWithLabels" selected>Aerial with labels</option>
       <option value="Road">Road</option>
       <option value="collinsBart">Collins Bart</option>
       <option value="ordnanceSurvey">Ordnance Survey</option>
     </select>
    <script>
      var styles = [
        'Road',
        'Aerial',
        'AerialWithLabels',
        'collinsBart',
        'ordnanceSurvey'
      ];
      var layers = [];
      for (var i = 0; i < styles.length; ++i) {
        layers.push(new ol.layer.Tile({
          visible: false,
          preload: Infinity,
          source: new ol.source.BingMaps({
            key: 'AnbQn6E4ec8NAER56JBhNCS88wOLYCg6TNVINbC2qHE7_zQQg583_GdBUWaHlqA-',
            imagerySet: styles[i]
          })
        }));
      }
      
      var map = new ol.Map({
        layers: layers,
        loadTilesWhileInteracting: true,
        target: 'map',
        view: new ol.View({
          center: [114.292653,30.614975],
          zoom: 16,
          projection:'EPSG:4326'
        })
      });

      var select = document.getElementById('layer-select');
      function onChange() {
        var style = select.value;
        for (var i = 0, ii = layers.length; i < ii; ++i) {
          layers[i].setVisible(styles[i] === style);
        }
      }
      select.addEventListener('change', onChange);
      onChange();
    </script>
  </body>
</html>