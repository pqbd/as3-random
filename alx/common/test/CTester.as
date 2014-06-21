package alx.common.test
{
  import alx.common.test.CUnitTests;

  /**
   * Tester.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CTester
  {
    /** Label of tester*/
    private var m_strLabel:String;
    /** Status of test process*/
    private var m_bError:Boolean;

    /**
     * Creates tester.
     * @param strLabel String
     */
    public function CTester( strLabel:String = null):void
    {
      if ( strLabel === null)
        strLabel = '';
      this.setLabel( strLabel);
      this.m_bError = false;
    }

    /**
     * Checks if was an error while test process.
     * @return Boolean
     */
    public function isError():Boolean
    {
      return this.m_bError;
    }
    /**
     * Sets label.
     * @param strValue String
     */
    public function setLabel( strValue:String):void
    {
      this.m_strLabel = strValue;
    }
    /**
     * Gets label.
     * @return String
     */
    public function getLabel():String
    {
      return this.m_strLabel;
    }

    /**
     * Checks value is true.
     * @param strTitle String
     * @param bTest Boolean
     * @return Boolean
     */
    public function isTrue( strTitle:String, bTest:Boolean):Boolean
    {
      if ( !bTest)
        this.error( strTitle, 'is not true');
      return bTest;
    }
    /**
     * Checks value is false.
     * @param strTitle String
     * @param bTest Boolean
     * @return Boolean
     */
    public function isFalse( strTitle:String, bTest:Boolean):Boolean
    {
      if ( bTest)
        this.error( strTitle, 'is not false');
      return !bTest;
    }
    /**
     * Checks that this method not called.
     * @param strTitle String
     * @return Boolean
     */
    public function notHere( strTitle:String):Boolean
    {
      return this.isFalse( strTitle, true);
    }
    /**
     * Checks value is equal to expected value.
     * @param strTitle String
     * @param anyTestValue Object
     * @param anyRightValue Object
     * @return Boolean
     */
    public function isEqual( strTitle:String, anyTestValue:*, anyRightValue:*):Boolean
    {
      var bAnswer:Boolean = true;
      if ( anyTestValue !== anyRightValue)
      {
        this.error( strTitle, 'is not equal :: ' + anyTestValue + ' !== ' + anyRightValue);
        bAnswer = false;
      }
      return bAnswer;
    }
    /**
     * Checks value is not equal to expected value.
     * @param strTitle String
     * @param anyTestValue Object
     * @param anyRightValue Object
     * @return Boolean
     */
    public function isNotEqual( strTitle:String, anyTestValue:*, anyRightValue:*):Boolean
    {
      var bAnswer:Boolean = true;
      if ( anyTestValue === anyRightValue)
      {
        this.error( strTitle, 'is equal :: ' + anyTestValue + ' === ' + anyRightValue);
        bAnswer = false;
      }
      return bAnswer;
    }

    /**
     * Invokes error in test process.
     * @param strTitle String
     * @param strComment String
     */
    public function error( strTitle:String, strComment:String = ''):void
    {
      this.m_bError = true;
      CUnitTests.error( strTitle, strComment);
    }
    /**
     * Gets success\fail line.
     * @return String
     */
    public function successLine():String
    {
      var strResult:String = this.getLabel()+'->';
      if ( this.isError())
        strResult += 'fail';
      else
        strResult += 'success';
      return strResult;
    }
	}
}