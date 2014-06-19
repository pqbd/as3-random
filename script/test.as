import alx.common.test.*;
import test.alx.common.util.CRandomUnitTest;

// refactoring
//CUnitTests.init( CTester, CUnitTests.SIMPLE_MODE, true);
// development
//CUnitTests.init( CTester, CUnitTests.EXTENDED_MODE, true);
//CUnitTests.init( CTester, CUnitTests.FULL_MODE, true);
CUnitTests.init( CTester, CUnitTests.FULL_MODE, false);

CUnitTests.run( CRandomUnitTest
              );
CUnitTests.printResult( root);