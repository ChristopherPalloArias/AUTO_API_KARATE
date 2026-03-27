package com.automationexercise.qa;

import com.intuit.karate.junit5.Karate;

/**
 * Karate test runner.
 * Ejecuta todos los feature files bajo el paquete com.automationexercise.qa.
 * El reporte HTML se genera automáticamente en: target/karate-reports/karate-summary.html
 *
 * Para ejecutar por tag:
 *   mvn test -Dkarate.options="--tags @get"
 */
class KarateRunnerTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
