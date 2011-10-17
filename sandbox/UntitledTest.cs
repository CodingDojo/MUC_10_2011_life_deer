using System.Collections.Generic;
using NUnit.Framework;

[TestFixture]
public class UntitledTest
{
    [Test]
    public void HitchHiker()
    {
        int expected = 6 * 9;
        int actual = Untitled.Answer;
        Assert.AreEqual(expected, actual);
    }
    
    [Test]
    public void GridWithoutGivenCellsReturnsNoNeighbors()
    {
        
        Grid grid = new Grid(3,3, null);
        List<bool> result = grid.GetNeighbors(1);
        Assert.AreEqual(0, result.Count);
         
    }
}

