--
-- Main Premake5 file for building Windows DirectX Error project.
-- Copyright (c) 2020-2023 by Danil (Kenny) Dukhovenko, All rights reserved.
--

-- Windows DirectX Error C++ Project
project "DxErr"
	kind "StaticLib"
	language "C++"
	staticruntime "on"
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	includedirs {
		"include",
		"src"
	}
	
	filter "system:windows"
		systemversion "latest"
		staticruntime "on"

		files {
			"src/dxerr.cpp",
			"include/**.h",
			"include/**.inl"
		}

		defines { 
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"