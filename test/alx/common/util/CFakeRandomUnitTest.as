﻿package test.alx.common.util{  import alx.common.util.CRandom  import alx.common.util.CFakeRandom  import test.alx.common.util.CRandomUnitTest  public class CFakeRandomUnitTest extends CRandomUnitTest  {    public function CFakeRandomUnitTest( strLabel:String):void    {      super( strLabel);    }    protected override function createRandom( nSeed:uint = 0):CRandom    {      return new CFakeRandom( nSeed);    }    protected override function testList():Array    {      return this.commonTestList().concat( new Array( this.testAsk));    }    public function testAsk()    {      var random:CFakeRandom = new CFakeRandom();      random.ask( 0.9, 0, 0.3, 0.5, 0.499999999);      this.getTester().isEqual( 'random.nextBoolean()'                              , random.nextBoolean()                              , false                              );      this.getTester().isEqual( 'random.nextBoolean()'                              , random.nextBoolean()                              , true                              );      this.getTester().isEqual( 'random.nextBoolean()'                              , random.nextBoolean()                              , true                              );      this.getTester().isEqual( 'random.nextBoolean()'                              , random.nextBoolean()                              , false                              );      this.getTester().isEqual( 'random.nextBoolean()'                              , random.nextBoolean()                              , true                              );      try      {        random.ask( 0.2, -0.3, 0.5);        this.getTester().notHere( 'random.ask( 0.2, -0.3, 0.5)');      }      catch( e:Error){}      try      {        random.ask( 0.2, 6, 0.5);        this.getTester().notHere( 'random.ask( 0.2, 6, 0.5)');      }      catch( e:Error){}    }  }}