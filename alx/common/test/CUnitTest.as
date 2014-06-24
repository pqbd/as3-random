package alx.common.test
{
  import alx.common.test.CUnitTests;
  import alx.common.test.CTester;

  /**
   * Abstract unit test.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CUnitTest
  {
    /** Releated tester*/
    private var m_tester:CTester;

    /**
     * Creates and run unit test.
     * @param strLabel String
     */
    public function CUnitTest( strLabel:String):void
    {
      this.m_tester = CUnitTests.createTester( strLabel);
      this.startTest();
      this.endTest()
      if (( CUnitTests.isMode( CUnitTests.EXTENDED_MODE)) || ( this.m_tester.isError()))
        CUnitTests.printLine( this.m_tester.successLine());
    }

    /**
     * Gets list of functions to run.
     * @return Array of Function
     */
    protected function testList():Array
    {
      throw new Error( 'testList must be implemented');
    }

    /** Starts unit test.*/
    public function startTest():void
    {
      var bNext = true;
      var arTest:Array = this.testList();
      for ( var i:int = 0; (( i < arTest.length) && ( bNext)); i++)
      {
        var testFunction:Function = arTest[ i];
        try
        {
          testFunction();
        }
        catch ( e:Error)
        {
          this.getTester().error( e.getStackTrace());
        }

        if ( this.getTester().isError())
        {
          bNext = false;
          try
          {
            this.getTester().error( "\t"+CUnitTests.functionToString( this, testFunction)+'()->fail');
          }
          catch ( e:Error)
          {
            this.getTester().error( e.getStackTrace());
          }
        }
        else
        {
          if ( CUnitTests.isMode( CUnitTests.FULL_MODE))
            CUnitTests.printLine( "\t"+CUnitTests.functionToString( this, testFunction)+'()->success');
        }
      }
    }
    /** Ends unit test.*/
    public function endTest():void
    {
    }
    /**
     * Gets related tester.
     * @return {@link alx.common.test.CTester}
     */
    public function getTester():CTester
    {
      return this.m_tester;
    }


  }
}