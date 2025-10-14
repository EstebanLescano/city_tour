plugins {
    id("com.android.application") 
    id("org.jetbrains.kotlin.android") 
    id("com.google.gms.google-services") 
    id("dev.flutter.flutter-gradle-plugin")
}

// 2. REPOSITORIOS (Bloque allprojects)
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 3. DEFINICIÓN DE DIRECTORIOS DE COMPILACIÓN (Build Dir)
val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

// 4. DEFINICIÓN DE TAREAS (La tarea 'clean')
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

// ------------------------------------------------------------------
// 5. CONFIGURACIÓN DE SUBPROYECTOS (DEBE IR AL FINAL)
// ------------------------------------------------------------------

subprojects {
    // Lógica para directorios de construcción
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
    
    // Dependencia de evaluación
    project.evaluationDependsOn(":app")

}
