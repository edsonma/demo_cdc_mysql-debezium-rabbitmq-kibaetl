require 'kiba'

class TestSource
  def each
    yield({ job_uuid: '14ef92f0-32f7-11fe-881c-b503f455d22f' })
  end
end


