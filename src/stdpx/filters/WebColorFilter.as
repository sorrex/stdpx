﻿///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2008-2009 Vincent Petithory - http://blog.lunar-dev.net/
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE. 
///////////////////////////////////////////////////////////////////////////////

package stdpx.filters 
{
	import stdpx.types.ShaderMetadata;
	import stdpx.types.IMetadataAttachedShader;
	
	import flash.display.Shader;
	
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;

/**
 * The WebColorFilter affects the colors of an image. Only web colors are allowed in the image.
 * All other colors will be rounded to the closest web color. 
 * 
 * <p>For information, a web color is restricted to the following values for each channel (RGB) : 
 * <ul>
 * 	<li>0 (0x00)</li>
 * 	<li>51 (0x33)</li>
 * 	<li>102 (0x66)</li>
 * 	<li>153 (0x99)</li>
 * 	<li>204 (0xCC)</li>
 * 	<li>255 (0xFF)</li>
 * </ul>
 * Thus, There are 216 possible web colors (6*6*6).
 * </p>
 */
public class WebColorFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="WebColorFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 */
	public function WebColorFilter() 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
	}
	
	/**
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new WebColorFilter();
	}
	
}
	
}
