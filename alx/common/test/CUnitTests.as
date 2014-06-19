package alx.common.test
{
  import flash.utils.*;
  import flash.display.DisplayObject;
  import flash.display.Sprite;
  import alx.common.test.CTester;
  /**
   * Unit test framework functions.
   * @author Alexander Volkov
   * @version 1.0.0
   */
  public class CUnitTests
  {
    /** Display only basic result*/
    public static const SIMPLE_MODE = 0;
    /** Display basic result of each test*/
    public static const EXTENDED_MODE = 1;
    /** Display all results*/
    public static const FULL_MODE = 2;

    /** Class to use as tester*/
    private static var s_testerClass:Class = CTester;
    /** Display mode*/
    private static var s_nDisplayMode:uint = CUnitTests.SIMPLE_MODE;
    /** Display mode*/
    private static var s_bShowCallStack:Boolean = true;
    /** Global status*/
    private static var s_bGlobalError:Boolean = false;

    /**
     * Inits framework.
     * @param testerClass Class
     * @param nDisplayMode uint
     * @param bShowCallStack Boolean
     */
    public static function init( testerClass:Class
                                , nDisplayMode:uint
                                , bShowCallStack:Boolean
                                ):void
    {
      CUnitTests.s_testerClass = testerClass;
      CUnitTests.s_bGlobalError = false;
      CUnitTests.s_nDisplayMode = nDisplayMode;
      CUnitTests.s_bShowCallStack = bShowCallStack;

      CUnitTests.printHeader();
    }
    /** Prints header.*/
    protected static function printHeader():void
    {
      var strDisplayMode:String = 'unknown';
      if ( CUnitTests.isMode( CUnitTests.SIMPLE_MODE, true))
        strDisplayMode = 'SIMPLE_MODE';
      else
      if ( CUnitTests.isMode( CUnitTests.EXTENDED_MODE, true))
        strDisplayMode = 'EXTENDED_MODE';
      else
      if ( CUnitTests.isMode( CUnitTests.FULL_MODE, true))
        strDisplayMode = 'FULL_MODE';

      CUnitTests.printLine( 'UnitTests v. '+CUnitTests.getVersion()
                          +' {Tester: '+CUnitTests.s_testerClass
                          +'; Display mode: '+strDisplayMode
                          +'; Show callstack: '+CUnitTests.s_bShowCallStack
                          +"}\n"
                          );
    }
    /** Gets version of framework.
     * @return String
     */
    public static function getVersion():String
    {
      return '1.0.0';
    }
    /** Checks if CallStack is needed.
     * @return Boolean
     */
    public static function isShowCallStack():Boolean
    {
      return CUnitTests.s_bShowCallStack;
    }
    /** Checks display mode.
     * @param nDisplayMode uint
     * @param bExact Boolean
     * @return Boolean
     */
    public static function isMode( nDisplayMode:uint, bExact: Boolean = false):Boolean
    {
      if ( bExact)
        return ( CUnitTests.s_nDisplayMode == nDisplayMode);
      else
        return ( CUnitTests.s_nDisplayMode >= nDisplayMode);
    }
    /**
     * Invokes global error.
     * @param strTitle String
     * @param strComment String
     */
    public static function error( strTitle:String, strComment:String = ''):void
    {
      CUnitTests.s_bGlobalError = true;
      if ( CUnitTests.isShowCallStack())
        throw Error( strTitle+"\t"+strComment);
      else
      {
        CUnitTests.printLine( strTitle);
        if ( strComment != '')
          CUnitTests.printLine( "\t"+strComment);
      }
    }
    /**
     * Checks if there is a global error.
     * @return Boolean
     */
    public static function isError():Boolean
    {
      return CUnitTests.s_bGlobalError;
    }
    /**
     * Tester fabric.
     * @param strLabel String
     * @return {@link alx.common.test.CTester}
     */
    public static function createTester( strLabel:String):CTester
    {
      return new CUnitTests.s_testerClass( strLabel);
    }
    /**
     * Prints text.
     * @param strValue String
     */
    public static function printLine( strValue:String):void
    {
      trace( strValue);
    }
    /** Prints results*/
    public static function printResult( display:DisplayObject = null):void
    {
      var nColor:uint = 0;
      if ( CUnitTests.isError())
      {
        nColor = 0xcc0000;
        CUnitTests.printLine( "\n"+'Fail');
      }
      else
      {
        nColor = 0x00cc00;
        CUnitTests.printLine( "\n"+'Success');
      }

      if ( display != null)
      {
        var sprite:Sprite = new Sprite();
        sprite.graphics.beginFill( nColor);
        sprite.graphics.drawRect( 0, 0, display.stage.stageWidth, display.stage.stageHeight);
        display.stage.addChild( sprite);
      }
    }
    /**
     * Runs unit tests.
     * @param arUnitTest Array of Class exteds CUnitTest
     */
    public static function run( ...arUnitTest):void
    {
      for ( var i:int; (( i < arUnitTest.length) && ( !CUnitTests.isError())); i++)
      {
        var unitTestClass:Class = arUnitTest[ i];
        new unitTestClass( unitTestClass);
      }
    }
    /**
     * Temp util function to get function name by function descriptor.
     * @param target Object
     * @param fun Function
     * @return String
     */
    public static function functionToString( target:Object, fun:Function):String
    {
      var strFunctionName:String = 'error';
      var type:XML = describeType( target);
      for each ( var node:XML in type..method)
      {
        if ( target[ node.@name] == fun)
        {
          strFunctionName = node.@name;
          break;
        }
      }
      return strFunctionName;
    }
  }
}