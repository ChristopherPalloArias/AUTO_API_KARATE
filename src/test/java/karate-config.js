function fn() {
  // Obtener la variable de entorno activa (dev / qa / prod). Por defecto: dev.
  var env = karate.env;
  if (!env) { env = 'dev'; }
  karate.log('Entorno activo:', env);

  var config = {
    // URL base de la API pública de Automation Exercise
    baseUrl: 'https://www.automationexercise.com',

    // Entorno actual para trazabilidad en reportes
    env: env
  };

  // Overrides por entorno (reservado para uso futuro)
  if (env === 'qa') {
    // config.baseUrl = 'https://qa.automationexercise.com';
  } else if (env === 'prod') {
    // config.baseUrl = 'https://www.automationexercise.com';
  }

  return config;
}
