////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.flex.html
{
	import org.apache.flex.core.UIBase;

    COMPILE::JS
    {
        import org.apache.flex.core.WrappedHTMLElement;
		import org.apache.flex.html.util.addElementToWrapper;
    }

	/**
	 *  The Input class represents an HTML <input> element
     *  
	 *  
     *  @toplevel
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion FlexJS 0.0
	 */
	public class Input extends UIBase
	{
		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function Input()
		{
			super();
		}
		
        private var _text:String = "";

        /**
         *  The text of the element
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
		public function get text():String
		{
            COMPILE::SWF
            {
                return _text;
            }
            COMPILE::JS
            {
                return textNode.nodeValue;
            }
		}

		public function set text(value:String):void
		{
            COMPILE::SWF
            {
                _text = value;
            }
            COMPILE::JS
            {
                textNode.nodeValue = value;
            }
		}
		
        private var _type:String;
        public function get type():String
        {
            return _type;
        }
        public function set type(value:String):void
        {
            _type = value;
            COMPILE::JS
            {
                if(element)
                    element.setAttribute('type', value);
            }
        }
        
        COMPILE::JS
        private var textNode:Text;
		
        /**
         * @flexjsignorecoercion org.apache.flex.core.WrappedHTMLElement
		 * @flexjsignorecoercion HTMLElement
         */
        COMPILE::JS
        override protected function createElement():WrappedHTMLElement
        {
			addElementToWrapper(this,'input');
            if(_type)
                element.setAttribute('type', _type);
            
            textNode = document.createTextNode('') as Text;
            element.appendChild(textNode);
            
            return element;
        }
    }
}
