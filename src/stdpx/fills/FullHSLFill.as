///////////////////////////////////////////////////////////////////////////////
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

package stdpx.fills 
{
	import stdpx.types.ShaderMetadata;
	import stdpx.types.IMetadataAttachedShader;
	import stdpx.types.IShaderFill;
	
	import flash.display.Shader;
	import flash.display.ShaderData;

public class FullHSLFill extends Shader implements IMetadataAttachedShader, IShaderFill 
{
	
	[Embed(source="FullHSLFill.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * @inheritDoc
	 */
	public function get fillWidth():Number
	{
		return 256;
	}
	
	/**
	 * @inheritDoc
	 */
	public function get fillHeight():Number
	{
		return 256;
	}
	
	public function FullHSLFill(saturation:uint = 100) 
	{
		super();
		this.byteCode = new ShaderByteCode();
		this.saturation = saturation;
	}
	
	/**
	 * @inheritDoc
	 */
	public function clone():Shader
	{
		return new FullHSLFill(saturation);
	}
	
	/**
	 * @inheritDoc
	 */
	public function valueOf():Shader
	{
		return this;
	}
	
	/**
	 * @inheritDoc
	 */
	public function toString():String
	{
		return "[Fill FullHSL]";
	}
	
	/**
	 * @private
	 */
	public function set saturation(value:uint):void
	{
		this.data.saturation.value[0] = value/100;
	}
	
	public function get saturation():uint
	{
		return uint(this.data.saturation.value[0]/100);
	}
	
}
	
}
