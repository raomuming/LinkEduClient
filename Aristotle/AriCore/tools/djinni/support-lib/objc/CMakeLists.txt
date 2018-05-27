cmake_minimum_required(VERSION 3.4.1)

project(djinni)

aux_source_directory(. SRCS)

add_library(djinni
    STATIC
    ${SRCS}
)