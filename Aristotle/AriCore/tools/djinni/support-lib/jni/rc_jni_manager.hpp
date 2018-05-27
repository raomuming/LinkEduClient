
#pragma once

#include <jni.h>


// jni.h should really put extern "C" in JNIEXPORT, but it doesn't. :(
#define CJNIEXPORT extern "C" JNIEXPORT

namespace rc_jni_manager {

/*
 * Global initialization and shutdown. Call these from JNI_OnLoad and JNI_OnUnload.
 */
void jniInit(JavaVM * jvm);
void jniShutdown();
JavaVM *getJVM();

} // namespace platform_bridge
