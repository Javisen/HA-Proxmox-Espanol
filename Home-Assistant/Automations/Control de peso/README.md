Un par de automatizaciones para controlar el peso y motivar segun el peso. Utiliza google cloud tts para anunciar el peso y motivar a la persona

Requisitos Previos

Para que estas automatizaciones funcionen, necesitas configurar lo siguiente en tu Home Assistant:
  - Entidades de Sensores: Un sensor de peso (en este ejemplo sensor.bluetooth_proxy_router_peso_sonia).
  - Ayudantes (Helpers): Un input_number.peso_dia_anterior para almacenar el valor histórico.
  - TTS: Tener configurada la integración de Google Cloud TTS y un media player (en este caso media_player.bano).
  - Voz: Se utiliza la voz es-ES-Wavenet-H para un acabado más natural.

Que tiene de bueno estas automatizaciones comparadas con una automatizacion simple:
  - Gestión de errores: El código ignora valores unknown o 0 para no dar mensajes erróneos si la báscula falla.
  - Aleatoriedad: Utiliza random para que los mensajes no sean siempre iguales y no resulten monótonos.
  - Historial: La segunda automatización busca en el historial del sensor para asegurar que el peso de "ayer" sea el último registrado antes de medianoche.
