
#include "rc_jni_manager.hpp"
#include <memory>

namespace rc_jni_manager {
// Set only once from JNI_OnLoad before any other JNI calls, so no lock needed.
static JavaVM * g_cachedJVM;

void jniInit(JavaVM * jvm) {
    g_cachedJVM = jvm;
}

void jniShutdown() {
    g_cachedJVM = nullptr;
}

JavaVM *getJVM() {
    return g_cachedJVM;
}

} // namespace platform_bridge
