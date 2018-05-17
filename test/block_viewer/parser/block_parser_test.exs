defmodule BlockViewerTest.BlockViewer.Parser.BlockParserTest do
  use ExUnit.Case

  alias BlockViewer.Model.Block
  alias BlockViewer.Model.Txn
  alias BlockViewer.Model.TxnInput
  alias BlockViewer.Model.Outpoint
  alias BlockViewer.Model.TxnOutput

  alias BlockViewer.Parser.BlockParser

  test "parse with a size == txn_count" do
    {:ok, payload} = File.read("test/fixtures/block/block_443794.bin")

    block = %Block{
      version: 536870912,
      previous_block: Base.decode16!("90C8B71249EDC25466A09633986E4E4E6DD48A578CD61B020000000000000000"),
      merkle_root: Base.decode16!("D40124CF6DA0D2D15404F7E402BDABA196A587ECA80AC7922669E49D4EB6EA74"),
      timestamp: 1481955409,
      bits: 402885509,
      nonce: 4063329650,
      txn_count: 9,
      txns: [
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("0000000000000000000000000000000000000000000000000000000000000000"),
                index: 4294967295},
              script_length: 42,
              signature_script: Base.decode16!("0392C5061D4D696E656420627920416E74506F6F6C206471202AC6C206205854D851C60300002F0B0200"),
              sequence: 4294967295,
            }
          ],
          outputs: [
            %TxnOutput{
              value: 1251025911,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914D190C364C43FF16CBEEDBB28308EFEF13DF61F8188AC")
            }
          ],
          lock_time: 0
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("8DEEB1AC054B7D4BCA058D125DDA41E9937EA34B7D1475B2E034ED84100443C3"),
                index: 0},
              script_length: 139,
              signature_script: Base.decode16!("483045022100BE0580129E98B4BE593B3EDF0C51EA7D1A64EA0175670B8B5CB890904D8ABF330220062D13FB315E6988624605A8FBE9796AC18FAB38B6EB66726FBF000D5190E0CF014104892E31D04537248C9461F9CF42F093F015624354DCF6E98F17BA582EF1BF17C3C727C4940CAC221FE0A4D60B3954047FCC7C53E24BB9268E5A3DE403247607D0"),
              sequence: 4294967295,
            }
          ],
          outputs: [
            %TxnOutput{
              value: 2636857,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A9146253907064AB8FF696B6FC38D0D4C53A7064363E88AC")
            }
          ],
          lock_time: 0
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("23F6720C406F614EFDDC04DDA403E23B83BD4A7FE477164D8C3BD1BEEB92CB8B"),
                index: 0},
              script_length: 106,
              signature_script: Base.decode16!("47304402202A76557928B174DA27C8617F3C9E265AD5938C9E26CAFC08603BF2264690D4D3022069DAAE4618774D44369E7383A010D8315ADC3582A04EBAAC424680052453FDCC0121031ABA88A786D3F8BEE819CB466E3262B136C5162BECF2CBD9A8C261000F118D7D"),
              sequence: 4294967295,
            },
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("4938193D9D5D22CF3DB002C4D048B9DB896ADA5943D2213A510B0092B1131DDD"),
                index: 0},
              script_length: 107,
              signature_script: Base.decode16!("4830450221009EEE672D512F71471C7865562066B21CB91B008E7771E4F9BBAC82D47BD005070220710A3DF0E48165C5538734E216348FA0CEA9CB5AC8D756FB31CB8B1EC96016DE01210208A5E7B5DE4CC1783B4B0A0FFB766B528DB7CC003A7251CE04A86AD1F85D72E0"),
              sequence: 4294967295,
            }
          ],
          outputs: [
            %TxnOutput{
              value: 25033000,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914E2BAE6CB86541A1C8DBA9609E080CBD0AE91DEE288AC")
            },
            %TxnOutput{
              value: 50000000,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A9144D83C2E4551D355112E421298CE7DD0B107302C088AC")
            }
          ],
          lock_time: 0
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("9656F497F25502C7BCF3ADB4C0A2F21F0568082B5868DCB28C453A48FD0C7C2A"),
                index: 0},
              script_length: 107,
              signature_script: Base.decode16!("483045022100C73BBA14BE90AB8E78D76746A58B6156E66CD4F2524EA819F19C42CC7615C0FC02204A4E1BC094E5C8718DEF800258B7BB7869991E847150DC247685964AC09581AC0121025EA12AFEB9C5BE1B266F81D29B4E330474CE870072CF733D610A743BC5943269"),
              sequence: 4294967295,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 9816100,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914BC5F81F63B1437F877D8D8FA968D77D0C0CB88D488AC")
            }
          ],
          lock_time: 0
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("FA76612F05B09D8EB166EDAC9BCBE7AA1061B8969CE5A28E351807D028FF55D1"),
                index: 6},
              script_length: 106,
              signature_script: Base.decode16!("473044022021ACE6DE6772EC8D6C3F9F735B48BFCDFE9ADCFF8D114FE2CD9D792E2BDF319202204EDA1427F64F3672C1630B77C6C0C99DE7596A194B024753F42BF32B47459BEA012103BA369C0510197E2F76AE2D2122F98E96B8271D72FA4E815F2BC49DBEFEB7330B"),
              sequence: 4294967295,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 98833776,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914542EF490F23393A6C4C985A0B9A19C9D27CFB44A88AC")
            },
            %TxnOutput{
              value: 6097500,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914B9CD9C909519867C1725622587DA68F0B9D6F8AA88AC")
            }
          ],
          lock_time: 0
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("3F12253D8122CFCE89EC1391C7172221E379226AFBE564ECB991EBF446D9B3BC"),
                index: 0},
              script_length: 106,
              signature_script: Base.decode16!("47304402207B4AA503854A4F72530974052CC291BFCC8D8A17D91FB71825E102B72FD78C1E02204024E1FEF3E42EDC61B4674BD6F039DFAABEBEA041697CE508CFB8AEA79D1F650121034C47175F230834EEEC40006645DF96626DDD03358FEEDB08B6AFF804B0F676EE"),
              sequence: 4294967294,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 1711281,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A91465E44F54680A01ED1E6C69E4E5923E3190500A9F88AC")
            },
            %TxnOutput{
              value: 119014,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914A975653544A50169BBAB7797E2CDD206E24AB54088AC")
            }
          ],
          lock_time: 443783
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("45CD5911E8C82F46B22FE37963C3B7714D585DD892A53399E6F5B4B71C0C222B"),
                index: 1},
              script_length: 106,
              signature_script: Base.decode16!("473044022003CA199A8F8DAEC0200DFDEE784DA178393D175822250155911BCAA6B44CA573022021B94FB7E658B6EFDF5CC1BAC762345EE447F70A39862337777724D3E7F8FB8E012102FCB500C3D41D6A23EC5517EDD8201591E5719134AB37BB47973E2579C3412A78"),
              sequence: 4294967294,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 236000000,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914F84D5180141863C7CB6609AAE06C811BFF4902D288AC")
            },
            %TxnOutput{
              value: 163900000,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914DF91057E3A4FB6E3BC10BFDA2FBDC4116C7DCCA388AC")
            }
          ],
          lock_time: 443783
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("7EA9CD173F932D39691C62C46D0469F5D699F345714299AC5C3E15B7465286AC"),
                index: 0},
              script_length: 106,
              signature_script: Base.decode16!("47304402206044FA1602F4F05DEDC391FB18FA6E36DEB5C056A792B403E481A7A06DD07F36022042E9F6EB2A57371548EEB1B90EAF7954399DDA51DDEACC4B1F729B701D53FCAB0121030BF57398BF1E141B3C6623E9D0685B42E73C7E9E33C489148B8604024F556194"),
              sequence: 4294967294,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 1190136,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914DDD8ED823DDE468ED5179A98D9EF167022DF7CC988AC")
            },
            %TxnOutput{
              value: 9472222,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914E21035A45EEF27014BA58F29F15C04596A29C9EA88AC")
            }
          ],
          lock_time: 443783
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("48597D658B13851E962D1C442CDF4A470189C80CED955C578BAB2CF3B1D75172"),
                index: 0},
              script_length: 106,
              signature_script: Base.decode16!("473044022016AC14CC04F7EBC7D9FA99BC15094648D76F3D9B70857533A50EB28795421BF10220566B5EDD16404F538D66EC5D1745CBDEEFCAB759A91DEE17528E44194E821B1B012102FBCBA0C4DF5B95EC50C9E700DEE89DCE0EAF372A4CA81FDB385B4BC4D6FECFAD"),
              sequence: 4294967295,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 10637166,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A91454CA22B88657CD2567F310BA2B016A7CED509E8388AC")
            },
            %TxnOutput{
              value: 50000000,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914CB275A1A7754B881A8AC27E9BEC3FC461C316D7888AC")
            }
          ],
          lock_time: 0
        },
      ]
    }

    assert BlockParser.parse(payload, 9) == {:ok, block}
  end

  test "parse with a size > txn_count" do
    {:ok, payload} = File.read("test/fixtures/block/block_443794.bin")

    block = %Block{
      version: 536870912,
      previous_block: Base.decode16!("90C8B71249EDC25466A09633986E4E4E6DD48A578CD61B020000000000000000"),
      merkle_root: Base.decode16!("D40124CF6DA0D2D15404F7E402BDABA196A587ECA80AC7922669E49D4EB6EA74"),
      timestamp: 1481955409,
      bits: 402885509,
      nonce: 4063329650,
      txn_count: 9,
      txns: [
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("0000000000000000000000000000000000000000000000000000000000000000"),
                index: 4294967295},
              script_length: 42,
              signature_script: Base.decode16!("0392C5061D4D696E656420627920416E74506F6F6C206471202AC6C206205854D851C60300002F0B0200"),
              sequence: 4294967295,
            }
          ],
          outputs: [
            %TxnOutput{
              value: 1251025911,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914D190C364C43FF16CBEEDBB28308EFEF13DF61F8188AC")
            }
          ],
          lock_time: 0
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("8DEEB1AC054B7D4BCA058D125DDA41E9937EA34B7D1475B2E034ED84100443C3"),
                index: 0},
              script_length: 139,
              signature_script: Base.decode16!("483045022100BE0580129E98B4BE593B3EDF0C51EA7D1A64EA0175670B8B5CB890904D8ABF330220062D13FB315E6988624605A8FBE9796AC18FAB38B6EB66726FBF000D5190E0CF014104892E31D04537248C9461F9CF42F093F015624354DCF6E98F17BA582EF1BF17C3C727C4940CAC221FE0A4D60B3954047FCC7C53E24BB9268E5A3DE403247607D0"),
              sequence: 4294967295,
            }
          ],
          outputs: [
            %TxnOutput{
              value: 2636857,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A9146253907064AB8FF696B6FC38D0D4C53A7064363E88AC")
            }
          ],
          lock_time: 0
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("23F6720C406F614EFDDC04DDA403E23B83BD4A7FE477164D8C3BD1BEEB92CB8B"),
                index: 0},
              script_length: 106,
              signature_script: Base.decode16!("47304402202A76557928B174DA27C8617F3C9E265AD5938C9E26CAFC08603BF2264690D4D3022069DAAE4618774D44369E7383A010D8315ADC3582A04EBAAC424680052453FDCC0121031ABA88A786D3F8BEE819CB466E3262B136C5162BECF2CBD9A8C261000F118D7D"),
              sequence: 4294967295,
            },
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("4938193D9D5D22CF3DB002C4D048B9DB896ADA5943D2213A510B0092B1131DDD"),
                index: 0},
              script_length: 107,
              signature_script: Base.decode16!("4830450221009EEE672D512F71471C7865562066B21CB91B008E7771E4F9BBAC82D47BD005070220710A3DF0E48165C5538734E216348FA0CEA9CB5AC8D756FB31CB8B1EC96016DE01210208A5E7B5DE4CC1783B4B0A0FFB766B528DB7CC003A7251CE04A86AD1F85D72E0"),
              sequence: 4294967295,
            }
          ],
          outputs: [
            %TxnOutput{
              value: 25033000,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914E2BAE6CB86541A1C8DBA9609E080CBD0AE91DEE288AC")
            },
            %TxnOutput{
              value: 50000000,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A9144D83C2E4551D355112E421298CE7DD0B107302C088AC")
            }
          ],
          lock_time: 0
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("9656F497F25502C7BCF3ADB4C0A2F21F0568082B5868DCB28C453A48FD0C7C2A"),
                index: 0},
              script_length: 107,
              signature_script: Base.decode16!("483045022100C73BBA14BE90AB8E78D76746A58B6156E66CD4F2524EA819F19C42CC7615C0FC02204A4E1BC094E5C8718DEF800258B7BB7869991E847150DC247685964AC09581AC0121025EA12AFEB9C5BE1B266F81D29B4E330474CE870072CF733D610A743BC5943269"),
              sequence: 4294967295,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 9816100,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914BC5F81F63B1437F877D8D8FA968D77D0C0CB88D488AC")
            }
          ],
          lock_time: 0
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("FA76612F05B09D8EB166EDAC9BCBE7AA1061B8969CE5A28E351807D028FF55D1"),
                index: 6},
              script_length: 106,
              signature_script: Base.decode16!("473044022021ACE6DE6772EC8D6C3F9F735B48BFCDFE9ADCFF8D114FE2CD9D792E2BDF319202204EDA1427F64F3672C1630B77C6C0C99DE7596A194B024753F42BF32B47459BEA012103BA369C0510197E2F76AE2D2122F98E96B8271D72FA4E815F2BC49DBEFEB7330B"),
              sequence: 4294967295,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 98833776,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914542EF490F23393A6C4C985A0B9A19C9D27CFB44A88AC")
            },
            %TxnOutput{
              value: 6097500,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914B9CD9C909519867C1725622587DA68F0B9D6F8AA88AC")
            }
          ],
          lock_time: 0
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("3F12253D8122CFCE89EC1391C7172221E379226AFBE564ECB991EBF446D9B3BC"),
                index: 0},
              script_length: 106,
              signature_script: Base.decode16!("47304402207B4AA503854A4F72530974052CC291BFCC8D8A17D91FB71825E102B72FD78C1E02204024E1FEF3E42EDC61B4674BD6F039DFAABEBEA041697CE508CFB8AEA79D1F650121034C47175F230834EEEC40006645DF96626DDD03358FEEDB08B6AFF804B0F676EE"),
              sequence: 4294967294,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 1711281,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A91465E44F54680A01ED1E6C69E4E5923E3190500A9F88AC")
            },
            %TxnOutput{
              value: 119014,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914A975653544A50169BBAB7797E2CDD206E24AB54088AC")
            }
          ],
          lock_time: 443783
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("45CD5911E8C82F46B22FE37963C3B7714D585DD892A53399E6F5B4B71C0C222B"),
                index: 1},
              script_length: 106,
              signature_script: Base.decode16!("473044022003CA199A8F8DAEC0200DFDEE784DA178393D175822250155911BCAA6B44CA573022021B94FB7E658B6EFDF5CC1BAC762345EE447F70A39862337777724D3E7F8FB8E012102FCB500C3D41D6A23EC5517EDD8201591E5719134AB37BB47973E2579C3412A78"),
              sequence: 4294967294,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 236000000,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914F84D5180141863C7CB6609AAE06C811BFF4902D288AC")
            },
            %TxnOutput{
              value: 163900000,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914DF91057E3A4FB6E3BC10BFDA2FBDC4116C7DCCA388AC")
            }
          ],
          lock_time: 443783
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("7EA9CD173F932D39691C62C46D0469F5D699F345714299AC5C3E15B7465286AC"),
                index: 0},
              script_length: 106,
              signature_script: Base.decode16!("47304402206044FA1602F4F05DEDC391FB18FA6E36DEB5C056A792B403E481A7A06DD07F36022042E9F6EB2A57371548EEB1B90EAF7954399DDA51DDEACC4B1F729B701D53FCAB0121030BF57398BF1E141B3C6623E9D0685B42E73C7E9E33C489148B8604024F556194"),
              sequence: 4294967294,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 1190136,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914DDD8ED823DDE468ED5179A98D9EF167022DF7CC988AC")
            },
            %TxnOutput{
              value: 9472222,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914E21035A45EEF27014BA58F29F15C04596A29C9EA88AC")
            }
          ],
          lock_time: 443783
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("48597D658B13851E962D1C442CDF4A470189C80CED955C578BAB2CF3B1D75172"),
                index: 0},
              script_length: 106,
              signature_script: Base.decode16!("473044022016AC14CC04F7EBC7D9FA99BC15094648D76F3D9B70857533A50EB28795421BF10220566B5EDD16404F538D66EC5D1745CBDEEFCAB759A91DEE17528E44194E821B1B012102FBCBA0C4DF5B95EC50C9E700DEE89DCE0EAF372A4CA81FDB385B4BC4D6FECFAD"),
              sequence: 4294967295,
            },
          ],
          outputs: [
            %TxnOutput{
              value: 10637166,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A91454CA22B88657CD2567F310BA2B016A7CED509E8388AC")
            },
            %TxnOutput{
              value: 50000000,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914CB275A1A7754B881A8AC27E9BEC3FC461C316D7888AC")
            }
          ],
          lock_time: 0
        },
      ]
    }

    assert BlockParser.parse(payload, 100) == {:ok, block}
  end

  test "parse with a size < txn_count" do
    {:ok, payload} = File.read("test/fixtures/block/block_443794.bin")

    block = %Block{
      version: 536870912,
      previous_block: Base.decode16!("90C8B71249EDC25466A09633986E4E4E6DD48A578CD61B020000000000000000"),
      merkle_root: Base.decode16!("D40124CF6DA0D2D15404F7E402BDABA196A587ECA80AC7922669E49D4EB6EA74"),
      timestamp: 1481955409,
      bits: 402885509,
      nonce: 4063329650,
      txn_count: 9,
      txns: [
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("0000000000000000000000000000000000000000000000000000000000000000"),
                index: 4294967295},
              script_length: 42,
              signature_script: Base.decode16!("0392C5061D4D696E656420627920416E74506F6F6C206471202AC6C206205854D851C60300002F0B0200"),
              sequence: 4294967295,
            }
          ],
          outputs: [
            %TxnOutput{
              value: 1251025911,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914D190C364C43FF16CBEEDBB28308EFEF13DF61F8188AC")
            }
          ],
          lock_time: 0
        },
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("8DEEB1AC054B7D4BCA058D125DDA41E9937EA34B7D1475B2E034ED84100443C3"),
                index: 0},
              script_length: 139,
              signature_script: Base.decode16!("483045022100BE0580129E98B4BE593B3EDF0C51EA7D1A64EA0175670B8B5CB890904D8ABF330220062D13FB315E6988624605A8FBE9796AC18FAB38B6EB66726FBF000D5190E0CF014104892E31D04537248C9461F9CF42F093F015624354DCF6E98F17BA582EF1BF17C3C727C4940CAC221FE0A4D60B3954047FCC7C53E24BB9268E5A3DE403247607D0"),
              sequence: 4294967295,
            }
          ],
          outputs: [
            %TxnOutput{
              value: 2636857,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A9146253907064AB8FF696B6FC38D0D4C53A7064363E88AC")
            }
          ],
          lock_time: 0}
      ]
    }

    assert BlockParser.parse(payload, 2) == {:ok, block}
  end

  test "parse with a size < 0" do
    {:ok, payload} = File.read("test/fixtures/block/block_443794.bin")

    block = %Block{
      version: 536870912,
      previous_block: Base.decode16!("90C8B71249EDC25466A09633986E4E4E6DD48A578CD61B020000000000000000"),
      merkle_root: Base.decode16!("D40124CF6DA0D2D15404F7E402BDABA196A587ECA80AC7922669E49D4EB6EA74"),
      timestamp: 1481955409,
      bits: 402885509,
      nonce: 4063329650,
      txn_count: 9,
      txns: [
        %Txn{
          version: 1,
          inputs: [
            %TxnInput{
              previous_output: %Outpoint{
                hash: Base.decode16!("0000000000000000000000000000000000000000000000000000000000000000"),
                index: 4294967295},
              script_length: 42,
              signature_script: Base.decode16!("0392C5061D4D696E656420627920416E74506F6F6C206471202AC6C206205854D851C60300002F0B0200"),
              sequence: 4294967295,
            }
          ],
          outputs: [
            %TxnOutput{
              value: 1251025911,
              pk_script_length: 25,
              pk_script: Base.decode16!("76A914D190C364C43FF16CBEEDBB28308EFEF13DF61F8188AC")
            }
          ],
          lock_time: 0
        }]
    }

    assert BlockParser.parse(payload, -1) == {:ok, block}
  end

  test "parse a non block data" do
    assert BlockParser.parse("JSON String") == {:error, "Invalid Block Type"}
  end
end

