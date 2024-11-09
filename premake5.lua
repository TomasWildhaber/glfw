project "GLFW"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
	staticruntime "on"

    targetdir (outputdir .. "$(Configuration)/$(ProjectName)")
	objdir (intoutputdir .. "$(Configuration)/$(ProjectName)")

    files
	{
		"src/**.h",
		"src/**.c",
	}

    includedirs
    {
        "src",
    }

	filter "system:windows"
		defines { "_GLFW_WIN32", "_CRT_SECURE_NO_WARNINGS" }

    filter "configurations:Debug"
		defines "DEBUG_CONFIG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "RELEASE_CONFIG"
		runtime "Release"
        optimize "on"

    filter "configurations:Distribution"
		defines "DISTRIBUTION_CONFIG"
		runtime "Release"
        optimize "on"