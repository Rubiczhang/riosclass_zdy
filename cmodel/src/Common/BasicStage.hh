#ifndef __BASICSTAGE_HH__
#define __BASICSTAGE_HH__

#include "Port.hh"

namespace Emulator
{

template <typename T>       // For ports

class BasicStage{
  public:
    std::shared_ptr<Emulator::Port<T> > InPort;
    std::shared_ptr<Emulator::Port<T> > OutPort;

    BasicStage(
      std::shared_ptr<Emulator::Port<T> > inport,
      std::shared_ptr<Emulator::Port<T> > outport
    ): InPort(inport), OutPort(outport);
  
    //    Caculate wires and regs
    virtual int32_t evaluate();

    //    Update the outport
    virtual int32_t advanced();
    
}       //class BasicStage

}       //namespace

#endif  //ifndef __BASICSTAGE_HH__