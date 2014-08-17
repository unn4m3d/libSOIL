# libSOIL for Mac OS X
This is libSOIL (Simple OpenGL Image Library) with modifications to the Makefile to let it install nicely on Mac OS X. By default, libSOIL.a will be installed in /usr/local/lib and the libSOIL headers will be installed in /usr/local/include/SOIL.

Forked from https://github.com/smibarber/libSOIL and incorporated changes from https://github.com/fenbf/SOIL_ext (commit 739ec6499f7befce10d3b6c37519c6b7fed6efea), which includes:

* **[in progress]** Added option to use immutable texture storage
 * When possible (when extension is supported) library can create texture using glTextureStorage and then call glTexSubImage.
 * See more here [OpenGL wiki](http://www.opengl.org/wiki/Texture\_Storage)
* **[done]** Mipmap generation using glGenerateMipmap
 * Original library scaled image to be POT and then used custom procedure to generate mipmaps. This can take some time.
 * This change uses glGenerateMipmapEXT (if GL\_EXT\_framebuffer\_object extension is available). This way Soil can create mipmaps for NPOT textures and use hardware support.
 * New flag is added: **SOIL\_FLAG\_GL\_MIPMAPS**. It can be passed to the SOIL\_load\_OGL\_texture\* procedures. If the extension (GL\_EXT\_framebuffer\_object) is not supported then function uses the same process as when passing **SOIL\_FLAG\_MIPMAPS**.
* **[done]** upgraded to the version **1.33** of [stb\_image](http://www.nothings.org/stb\_image.c)
 * stb\_image\_write.c/.h were created. Those files contain missing functionality that was cut from the newer version of stbi (cut in 1.22)  
* **[done]** Using only Modern OpenGL functionalities (when possible)
 * *CLAMP\_TO\_EDGE* instead of *GL\_CLAMP*
 *  *glGetStringi* instead of *glGetString(GL\_EXTENSIONS)* 

# Installing
Clone this repo, make, make install. To install elsewhere, change the INCLUDEDIR and LIBDIR in the Makefile.

# License
Public domain.

