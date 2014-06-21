import alx.common.test.*;
import test.alx.common.util.CRandomUnitTest;
import test.alx.common.util.CFakeRandomUnitTest;

// refactoring
//CUnitTests.init( CTester, CUnitTests.SIMPLE_MODE, true);
// development
//CUnitTests.init( CTester, CUnitTests.EXTENDED_MODE, true);
//CUnitTests.init( CTester, CUnitTests.FULL_MODE, true);
CUnitTests.init( CTester, CUnitTests.FULL_MODE, false);

CUnitTests.run( CRandomUnitTest
              , CFakeRandomUnitTest
              );
CUnitTests.printResult( root);