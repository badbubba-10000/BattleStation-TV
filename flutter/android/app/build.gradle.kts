// Modified for BattleStation TV, 2026-11-22. See BSTV-NOTICE.md.
import java.util.Base64
import java.util.Properties

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// The release key lives outside the repository (key.properties is git-ignored); release builds fail without it; private values are never printed.
val keyProps = Properties().apply {
    val f = System.getenv("BSTV_ANDROID_KEY_PROPERTIES")?.let { file(it) } ?: rootProject.file("key.properties")
    if (f.exists()) f.inputStream().use { load(it) }
}

android {
    namespace = "tv.battlestation.bstv"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "tv.battlestation.bstv"
        // Phase 1 targets ARM64; filter transitive native player libraries as well.
        ndk {
            abiFilters.clear()
abiFilters.add("arm64-v8a")
abiFilters.add("x86_64")
        }
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 26 // Android 8
        targetSdk = flutter.targetSdkVersion
        // Uses the version code from pubspec.yaml. When using split APKs, 1000 * ABI_VERSION
        // is added automatically by Flutter. (https://developer.android.com/studio/build/configure-apk-splits#configure-APK-versions)
        // You can force using the value of versionCode by specifying the `-P force-version-code-ignoring-abi=true`
        // flag during build.
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        // The in-app update installs a downloaded APK, which needs REQUEST_INSTALL_PACKAGES. A store build (--dart-define=STORE_BUILD=true) does not
        // update itself (Google Play restricts that permission), so there the placeholder is INTERNET, which the manifest already declares.
        val defines: List<String> = (project.findProperty("dart-defines") as? String)?.split(",")?.map { String(Base64.getDecoder().decode(it)) } ?: emptyList<String>()
        manifestPlaceholders["installPermission"] =
            if ("STORE_BUILD=true" in defines) "android.permission.INTERNET" else "android.permission.REQUEST_INSTALL_PACKAGES"
    }

    signingConfigs {
        if (keyProps.containsKey("storeFile")) {
            create("release") {
                storeFile = file(keyProps["storeFile"] as String)
                storePassword = keyProps["storePassword"] as String
                keyAlias = keyProps["keyAlias"] as String
                keyPassword = keyProps["keyPassword"] as String
            }
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.findByName("release")
            if (gradle.startParameter.taskNames.any { it.contains("release", ignoreCase = true) } && signingConfig == null) {
                throw GradleException("Release signing is required. Configure the existing external release key; debug fallback is forbidden.")
            }
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

