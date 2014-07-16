﻿package test.alx.common.util{  import alx.common.util.IRandom;  import alx.common.util.CRandom;  public class CRandomUnitTest extends CAbstractRandomUnitTest  {    public function CRandomUnitTest( strLabel:String):void    {      super( strLabel);    }    protected override function testList():Array    {      return super.testList().concat( new Array( this.testMyNextBoolean                                                , this.testMyNextSign                                                , this.testMyNextBit                                                )                                     );    }    protected override function createRandom( nSeed:uint = 0):IRandom    {      return new CRandom( nSeed);    }    public function testMyNextBoolean():void    {      var random:IRandom = this.createRandom( 47);      this.getTester().isEqual( 'random.nextBoolean()'                              , random.nextBoolean()                              , true                              );      this.getTester().isEqual( 'random.nextBoolean()'                              , random.nextBoolean()                              , false                              );      this.getTester().isEqual( 'random.nextBoolean()'                              , random.nextBoolean()                              , true                              );    }    public function testMyNextSign():void    {      var random:IRandom = this.createRandom( 47);      this.getTester().isEqual( 'random.nextSign()'                              , random.nextSign()                              , 1                              );      this.getTester().isEqual( 'random.nextSign()'                              , random.nextSign()                              , -1                              );      this.getTester().isEqual( 'random.nextSign()'                              , random.nextSign()                              , 1                              );    }    public function testMyNextBit():void    {      var random:IRandom = this.createRandom( 47);      this.getTester().isEqual( 'random.nextBit()'                              , random.nextBit()                              , 1                              );      this.getTester().isEqual( 'random.nextBit()'                              , random.nextBit()                              , 0                              );      this.getTester().isEqual( 'random.nextBit()'                              , random.nextBit()                              , 1                              );    }  }}