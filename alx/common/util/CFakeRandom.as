﻿package alx.common.util{  /**   * Fake random number generator.   * @author Alexander Volkov   * @version 1.0   */  public class CFakeRandom extends CRandom  {    private var m_arRandomSequence:Array;    /**     * Creates new fake random generator.     * @param nSeed uint     */    public function CFakeRandom( nSeed:uint = 0):void    {      super( nSeed);      this.ask();    }    /**     * Asks generator to generate certain sequence.     * @return {@link CFakeRandom this}     */    public function ask( ...arValue):CFakeRandom    {      this.m_arRandomSequence = arValue;      return this;    }    protected override function next( nBits:uint):uint    {      var nSeed = this.getSeed() * 0x5DEECE66D;      this.setSeed( nSeed);      return ( nSeed >>> ( 32 - nBits));    }    protected override function generate():Number    {      if ( this.m_arRandomSequence.length > 0)        return this.m_arRandomSequence.shift();      else        return this.next( 32) / uint.MAX_VALUE;    }  }}